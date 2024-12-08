## frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

namespace :lint do
  desc 'Run slim-lint and minitest tests'
  task :all do
    puts 'Running slim-lint...'
    system('bundle exec slim-lint')

    puts 'Running minitest tests...'
    system('bundle exec ruby -Itest test/**/*_test.rb')
  end
end
