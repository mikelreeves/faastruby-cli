module FaaStRuby
  module Command
    require 'faastruby/cli/base_command'

    COMMANDS = {
      'new' => Proc.new do
        require 'faastruby/cli/commands/function/new'
        FaaStRuby::Command::Function::New
      end,
      'deploy-to' => Proc.new do
        require 'faastruby/cli/commands/function/deploy_to'
        FaaStRuby::Command::Function::DeployTo
      end,
      'remove-from' => Proc.new do
        require 'faastruby/cli/commands/function/remove_from'
        FaaStRuby::Command::Function::RemoveFrom
      end,
      'update-context' => Proc.new do
        require 'faastruby/cli/commands/function/update_context'
        FaaStRuby::Command::Function::UpdateContext
      end,
      # 'upgrade' => Proc.new do
      #   require 'faastruby/cli/commands/function/upgrade'
      #   FaaStRuby::Command::Function::Upgrade
      # end,
      'build' => Proc.new do
        require 'faastruby/cli/commands/function/build'
        FaaStRuby::Command::Function::Build
      end,
      'create-workspace' => Proc.new do
        require 'faastruby/cli/commands/workspace/create'
        FaaStRuby::Command::Workspace::Create
      end,
      'cp' => Proc.new do
        require 'faastruby/cli/commands/workspace/cp'
        FaaStRuby::Command::Workspace::CP
      end,
      'rm' => Proc.new do
        require 'faastruby/cli/commands/workspace/rm'
        FaaStRuby::Command::Workspace::RM
      end,
      'update-workspace' => Proc.new do
        require 'faastruby/cli/commands/workspace/update'
        FaaStRuby::Command::Workspace::Update
      end,
      'destroy-workspace' => Proc.new do
        require 'faastruby/cli/commands/workspace/destroy'
        FaaStRuby::Command::Workspace::Destroy
      end,
      'list-workspace' => Proc.new do
        require 'faastruby/cli/commands/workspace/list'
        FaaStRuby::Command::Workspace::List
      end,
      'new-project' => Proc.new do
        require 'faastruby/cli/commands/project/new'
        FaaStRuby::Command::Project::New
      end,
      'deploy' => Proc.new do
        require 'faastruby/cli/commands/project/deploy'
        FaaStRuby::Command::Project::Deploy
      end,
      'up' => Proc.new do
        require 'faastruby/cli/commands/project/deploy'
        FaaStRuby::Command::Project::Deploy
      end,
      'down' => Proc.new do
        require 'faastruby/cli/commands/project/down'
        FaaStRuby::Command::Project::Down
      end,
      'test' => Proc.new do
        require 'faastruby/cli/commands/function/test'
        FaaStRuby::Command::Function::Test
      end,
      'run' => Proc.new do
        require 'faastruby/cli/commands/function/run'
        FaaStRuby::Command::Function::Run
      end,
      # 'add-credentials' => Proc.new do
      #   require 'faastruby/cli/commands/credentials/add'
      #   FaaStRuby::Command::Credentials::Add
      # end,
      # 'list-credentials' => Proc.new do
      #   require 'faastruby/cli/commands/credentials/list'
      #   FaaStRuby::Command::Credentials::List
      # end,
      'help' => Proc.new do
        require 'faastruby/cli/commands/help'
        FaaStRuby::Command::Help
      end,
      '-h' => Proc.new do
        require 'faastruby/cli/commands/help'
        FaaStRuby::Command::Help
      end,
      '--help' => Proc.new do
        require 'faastruby/cli/commands/help'
        FaaStRuby::Command::Help
      end,
      '-v' => Proc.new do
        require 'faastruby/cli/commands/version'
        FaaStRuby::Command::Version
      end,
      'watch' => Proc.new do
        require 'faastruby/local'
        FaaStRuby::Local.start!
      end,
      'signup' => Proc.new do
        require 'faastruby/cli/commands/account/signup'
        FaaStRuby::Command::Account::Signup
      end,
      'confirm-account' => Proc.new do
        require 'faastruby/cli/commands/account/confirm'
        FaaStRuby::Command::Account::Confirm
      end,
      'login' => Proc.new do
        require 'faastruby/cli/commands/account/login'
        FaaStRuby::Command::Account::Login
      end,
      'logout' => Proc.new do
        require 'faastruby/cli/commands/account/logout'
        FaaStRuby::Command::Account::Logout
      end,
      'migrate-workspaces' => Proc.new do
        require 'faastruby/cli/commands/workspace/migrate'
        FaaStRuby::Command::Workspace::Migrate
      end,
      'update' => Proc.new do
        FaaStRuby::Command::Update
      end
    }

    class Update < BaseCommand
      def initialize(args)
        @args = args
        help
      end

      def run
        exec "gem update faastruby"
      end

      def self.help
        "update"
      end

      def usage
        puts "\n# Update FaaStRuby CLI to the latest version."
        puts "\nUsage: faastruby #{self.class.help}\n\n"
      end
    end
  end
end
