#
# Cookbook:: windows_tasks
# Recipe:: default
#

def manage_task(
    task,
    action_option,
    task_name_option,
    force_option,
    command_option,
    cwd_option,
    user_option,
    password_option,
    run_level_option,
    frequency_option,
    frequency_mod_option,
    start_day_option,
    start_time_option,
    interactive_option,
    day_option,
    months_option,
    idle_time_option
)

  windows_task task do

    if action_option
      action action_option
    end

    if task_name_option
      task_name task_name_option
    end

    unless force_option.nil?
      force force_option
    end

    if command_option
      command command_option
    end

    if cwd_option
      cwd cwd_option
    end

    if user_option
      user user_option
    end

    if password_option
      password password_option
    end

    if run_level_option
      run_level run_level_option
    end

    if frequency_option
      frequency frequency_option
    end

    if frequency_mod_option
      frequency_modifier frequency_mod_option
    end

    if start_day_option
      start_day start_day_option
    end

    if start_time_option
      start_time start_time_option
    end

    unless interactive_option.nil?
      interactive_enabled interactive_option
    end

    if day_option
      day day_option
    end

    if months_option
      months months_option
    end

    if idle_time_option
      idle_time idle_time_option
    end

  end

end

# Global value for ignoring failures
ignore_fail_option = node['windows_tasks']['ignore_failures']

if node['windows_tasks']['tasks']
  node['windows_tasks']['tasks'].each do |task, task_options|

    unless task_options['ignore_failure'].nil?
      ignore_fail_option = task_options['ignore_failure']
    end

    action_option = false
    if task_options['action']
      case task_options['action'].downcase
        when 'create'
          action_option = :create
        when 'delete'
          action_option = :delete
        when 'run'
          action_option = :run
        when 'end'
          action_option = :end
        when 'change'
          action_option = :change
        when 'enable'
          action_option = :enable
        when 'disable'
          action_option = :disable
        else
          action_option = false
      end
    end

    task_name_option = task
    if task_options['task_name']
      task_name_option = task_options['task_name']
    end

    force_option = nil
    unless task_options['force'].nil?
      force_option = task_options['force']
    end

    command_option = false
    if task_options['command']
      command_option = task_options['command']
    end

    cwd_option = false
    if task_options['cwd']
      cwd_option = task_options['cwd']
    end

    user_option = false
    if task_options['user']
      user_option = task_options['user']
    end

    password_option = false
    if user_option && task_options['password']
      password_option = task_options['password']
    end

    run_level_option = false
    if task_options['run_level']
      case task_options['run_level'].downcase
        when 'limited'
          run_level_option = :limited
        when 'highest'
          run_level_option = :highest
        else
          run_level_option = false
      end
    end

    frequency_option = false
    if task_options['frequency']
      case task_options['frequency'].downcase
        when 'hourly'
          frequency_option = :hourly
        when 'daily'
          frequency_option = :daily
        when 'weekly'
          frequency_option = :weekly
        when 'monthly'
          frequency_option = :monthly
        when 'once'
          frequency_option = :once
        when 'on_logon'
          frequency_option = :on_logon
        when 'onstart'
          frequency_option = :onstart
        when 'on_idle'
          frequency_option = :on_idle
        else
          frequency_option = false
      end
    end

    frequency_mod_option = false
    if task_options['frequency_modifier']
      frequency_mod_option = task_options['frequency_modifier']
    end

    start_day_option = false
    if task_options['start_day']
      start_day_option = task_options['start_day']
    end

    start_time_option = false
    if task_options['start_time']
      start_time_option = task_options['start_time']
    end

    interactive_option = nil
    if user_option && password_option
      unless task_options['interactive_enabled'].nil?
        interactive_option = task_options['interactive_enabled']
      end
    end

    day_option = false
    if task_options['day']
      day_option = task_options['day']
    end

    months_option = false
    if task_options['months']
      months_option task_options['months']
    end

    idle_time_option = false
    if task_options['idle_time']
      idle_time_option = task_options['idle_time']
    end

    # If we are ignoring failures then run in a rescue block
    if ignore_fail_option
      begin
        manage_task(
            task,
            action_option,
            task_name_option,
            force_option,
            command_option,
            cwd_option,
            user_option,
            password_option,
            run_level_option,
            frequency_option,
            frequency_mod_option,
            start_day_option,
            start_time_option,
            interactive_option,
            day_option,
            months_option,
            idle_time_option
        )
      rescue
        next
      end
    else
      manage_task(
          task,
          action_option,
          task_name_option,
          force_option,
          command_option,
          cwd_option,
          user_option,
          password_option,
          run_level_option,
          frequency_option,
          frequency_mod_option,
          start_day_option,
          start_time_option,
          interactive_option,
          day_option,
          months_option,
          idle_time_option
      )
    end

  end
end