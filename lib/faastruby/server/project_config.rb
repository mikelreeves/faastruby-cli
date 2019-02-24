module FaaStRuby
  class ProjectConfig

    def self.public_dir
      "#{SERVER_ROOT}/#{project_config['public_dir'] || 'public'}"
    end

    def self.functions_dir
      "#{SERVER_ROOT}/#{project_config['functions_dir'] || 'functions'}"
    end

    def self.project_config
      YAML.load(File.read(PROJECT_YAML_FILE))['project']
    end

    def self.root_to
      project_config['root_to'] || 'root'
    end

    def self.catch_all
      project_config['catch_all'] || 'catch-all'
    end

    def self.secrets
      YAML.load(File.read(SECRETS_FILE))['secrets'] || {}
    end

    def self.deploy_environment_secrets
      secrets[DEPLOY_ENVIRONMENT] || {}
    end

    def self.secrets_for_function(function_name)
      deploy_environment_secrets[function_name] || {}
    end
  end
end