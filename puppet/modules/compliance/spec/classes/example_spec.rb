require 'spec_helper'

describe 'compliance' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "compliance class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('compliance::params') }
          it { is_expected.to contain_class('compliance::install').that_comes_before('compliance::config') }
          it { is_expected.to contain_class('compliance::config') }
          it { is_expected.to contain_class('compliance::service').that_subscribes_to('compliance::config') }

          it { is_expected.to contain_service('compliance') }
          it { is_expected.to contain_package('compliance').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'compliance class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('compliance') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
