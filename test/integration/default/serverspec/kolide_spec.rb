require 'serverspec'

# Required by serverspec
set :backend, :exec

## Use Junit formatter output, supported by jenkins
#require 'yarjuf'
#RSpec.configure do |c|
#    c.formatter = 'JUnit'
#end


describe service('kolide') do
  it { should be_enabled }
  it { should be_running }
end  
describe process("fleet") do
  its(:user) { should eq "_kolide" }
  its(:args) { should match /--config \/etc\/kolide\/kolide.yml/ }
  its(:count) { should eq 1 }
  it { should be_running }
end
describe port(8080) do
#  it { should be_listening.with('tcp') }
  it { should be_listening.with('tcp6') }
end

describe file('/var/log/syslog'), :if => os[:family] == 'debian' || os[:family] == 'ubuntu' do
  its(:content) { should match /kolide\[[0-9]+\]: Using config file:/ }
  its(:content) { should match /kolide\[[0-9]+\]: {"component":"license-checker",/ }
  its(:content) { should match /kolide\[[0-9]+\]: {"address":"0.0.0.0:8080","msg":"listening","transport":/ }
  its(:content) { should_not match /kolide\[[0-9]+\]: .*permission denied.*/ }
end
describe file('/var/log/messages'), :if => os[:family] == 'redhat' do
  its(:content) { should match /kolide: Using config file:/ }
  its(:content) { should match /kolide: {"component":"license-checker",/ }
  its(:content) { should match /kolide: {"address":"0.0.0.0:8080","msg":"listening","transport":/ }
  its(:content) { should_not match /kolide: .*permission denied.*/ }
end
