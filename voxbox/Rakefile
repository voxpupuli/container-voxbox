require 'voxpupuli/test/rake'
require 'voxpupuli/acceptance/rake'
require 'voxpupuli/release/rake_tasks'
require 'ra10ke'

# disable error message internationalisation
# this uses fast_gettext/gettext-setup and depending on the load order it fails
# we don't have complete internationalisation and nobody uses it, so we can just disable it
# https://github.com/voxpupuli/ra10ke/issues/39
# https://github.com/voxpupuli/container-voxbox/issues/112
Puppet[:disable_i18n] = true

Ra10ke::RakeTask.new

namespace :voxpupuli do
  namespace :custom do
    desc 'Lint with all puppet-lint checks'
    task :lint_all do
      # re-enable by puppetlabs disabled checks from puppetlabs/spec_helper
      # see: https://github.com/puppetlabs/puppetlabs_spec_helper/blob/70de49db0a242f83e9ff39ea8a03c830339f8368/lib/puppetlabs_spec_helper/rake_tasks.rb#L169-L177
      puppet_lint_enable_checks = %w[
        140chars
        class_inherits_from_params_class
        class_parameter_defaults
        autoloader_layout
        documentation
        single_quote_string_with_variables
      ]

      puppet_lint_enable_checks.each do |check|
        PuppetLint.configuration.send(:"enable_#{check}")
      end

      Rake::Task[:lint].invoke
    end
  end
end
