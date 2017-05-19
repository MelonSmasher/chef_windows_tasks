name 'windows_tasks'
maintainer 'Alex Markessinis'
maintainer_email 'markea125@gmail.com'
license 'MIT'
description 'Manage Windows scheduled tasks through attributes.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.2'
issues_url 'https://github.com/MelonSmasher/chef_windows_tasks/issues' if respond_to?(:issues_url)
source_url 'https://github.com/MelonSmasher/chef_windows_tasks' if respond_to?(:source_url)
supports 'windows'
depends 'windows', '>= 2.1.1'
chef_version '>= 12.1' if respond_to?(:chef_version)