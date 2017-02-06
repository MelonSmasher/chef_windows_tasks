# Windows Tasks

Manage Windows scheduled tasks through attributes.

---

## Requires

* `platform == 'windows'`
* `chef_version '>= 12.1'`
* `cookbook 'windows', '~> 2.1.1'`

## Usage

### manage_windows_tasks::default

Just include `manage_windows_tasks` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[windows_tasks]"
  ]
}
```

Then move on to filling out some attributes.

## Attributes

### Ignore Failures

This set the ignore_failures default value for each task you define.

Default Value: 

- `false`

Ruby usage:

```ruby
node['windows_tasks']['ignore_failures'] = true
```

JSON usage:

```json
{
  "windows_tasks": {
    "ignore_failures": true
  }
}
```

### Tasks

The set of tasks that you intend to manage.

Ruby usage:

```ruby
node['windows_tasks']['tasks'] = [
    "GoogleUpdateTaskMachineCore" => [
      "action" => 'delete'
    ],
    "Adobe Flash Player Updater" => [
      "action" => 'delete'
    ],
    "chef-client" => [
      "ignore_failures" => false, # Overriding the global settings set earlier
      "user" => "Administrator",
      "password" => "$ecR3t",
      "cwd" => "C:\\chef\\bin",
      "command" => "chef-client -L C:\\tmp\\",
      "run_level" => "highest",
      "frequency" => "minute",
      "frequency_modifier" => 15
    ]
]
```

JSON usage:

```json
{
  "windows_tasks": {
    "tasks": {
      "GoogleUpdateTaskMachineCore": {
        "action": "delete"
      },
      "Adobe Flash Player Updater": {
        "action": "delete"
      },
      "chef-client": {
        "ignore_failures": false,
        "user": "Administrator",
        "password": "$ecR3t",
        "cwd": "C:\\chef\\bin",
        "command": "chef-client -L C:\\tmp\\",
        "run_level": "highest",
        "frequency": "minute",
        "frequency_modifier": 15
      }
    }
  }
}
```

More examples and task parameters can be extrapolated from [this section](https://supermarket.chef.io/cookbooks/windows/versions/2.1.1/#windows_task) of the `windows` cookbook.