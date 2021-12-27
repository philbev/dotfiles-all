require 'rls/version'

class RLS::Runner < Struct.new(:options)
  def release!
    puts 'Debug run...' if debug
    # TODO: show diff log since last deploy
    # TODO: ensure all commits are pushed to github
    # TODO: ask to run tests?
    # deploy
    execute "git push #{options[:remote]} #{branch} #{force ? '-ff' : ''}"
    # notify newrelic
    execute "newrelic deployments -a '#{app_name}' -e '#{env}'" if notify_newrelic?
    # TODO: run any migrations (backup before)
  end

  private

  def execute(cmd)
    puts "Running: #{cmd.strip!}"

    return true if debug

    unless system(cmd)
      $stderr.puts "command: '#{cmd}' failed!"
      exit(1)
    end
  end

  def notify_newrelic?
    app_name.size > 0 && app_name != 'off'
  end

  def method_missing(m, *args, &block)
    options.key?(m.to_sym) ? options[m.to_sym] : super
  end
end
