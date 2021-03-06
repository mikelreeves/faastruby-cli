require 'ostruct'
module FaaStRuby
  module Command
    module Function
      class FunctionBaseCommand < BaseCommand
        # --- Example YAML
        # name: example
        # test:
        #   command: "rspec"
        #   on_fail:
        #     build: false
        #     deploy: false
        def load_yaml
          FaaStRuby::CLI.error("It looks like you created this function with an old version of faastruby. Please run 'faastruby upgrade'.") if File.file?('handler.rb') && !File.file?('faastruby.yml')
          FaaStRuby::CLI.error("Could not find file 'faastruby.yml' in the current directory") if !File.file?('faastruby.yml') && @options['function_name'].nil?
          @yaml_config = YAML.load(File.read('./faastruby.yml'))
          FaaStRuby::CLI.error("Could read function name from 'faastruby.yml'. Make sure you have a key 'name: FUNCTION_NAME' in that file!") unless @yaml_config['name']
        end
      end
    end
  end
end