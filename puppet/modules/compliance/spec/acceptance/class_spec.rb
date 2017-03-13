require 'spec_helper'

describe 'compliance checks' do
  context 'insec compliance' do
    describe file('/tmp/insec-compliance') do
      it { should be_file }
      it { should contain('I am internal security compliant.') }
      it { should be_mode 644 }
    end
  end

  context 'finsec compliance' do
    describe file('/tmp/finsec-compliance') do
      it { should be_file }
      it { should contain('I am financial sector compliant.') }
      it { should be_mode 644 }
    end
  end

  context 'pubsec compliance' do
    describe file('/tmp/pubsec-compliance') do
      it { should be_file }
      it { should contain('I am public sector compliant.') }
      it { should be_mode 644 }
    end
  end
end
