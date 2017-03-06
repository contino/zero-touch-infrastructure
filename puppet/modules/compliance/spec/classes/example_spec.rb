require 'spec_helper'

describe 'apache' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "apache class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('apache::params') }
          it { is_expected.to contain_class('apache::install').that_comes_before('apache::config') }
          it { is_expected.to contain_class('apache::config') }
          it { is_expected.to contain_class('apache::service').that_subscribes_to('apache::config') }

          it { is_expected.to contain_service('apache') }
          it { is_expected.to contain_package('apache').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'apache class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('apache') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
