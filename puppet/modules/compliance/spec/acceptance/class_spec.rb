require 'spec_helper'

describe 'apache class' do
  context 'default parameters' do
    describe file('/var/www/html/index.html') do
      it { should be_file }
      it { should contain('I am compliant.') }
      it { should be_mode 644 }
    end
  end
end
