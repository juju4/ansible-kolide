require 'serverspec'

# Required by serverspec
set :backend, :exec

## Use Junit formatter output, supported by jenkins
#require 'yarjuf'
#RSpec.configure do |c|
#    c.formatter = 'JUnit'
#end


describe service('mysqld') do
  it { should be_enabled }
  it { should be_running }
end  
describe service('redis') do
  it { should be_enabled }
  it { should be_running }
end  
describe service('kolide') do
  it { should be_enabled }
  it { should be_running }
end  
describe process("kolide") do
  its(:user) { should eq "_kolide" }
  its(:args) { should match /--config \/etc\/kolide\/config.yml/ }
  its(:count) { should eq 1 }
  it { should be_running }
end
describe port(8080) do
  it { should be_listening.with('tcp') }
end

describe file('/var/log/syslog'), :if => os[:family] == 'debian' || :if => os[:family] == 'ubuntu' do
  its(:content) { should match /kolide: Using config file:/ }
  its(:content) { should match /kolide: {"component":"license-checker","msg":"starting"/ }
  its(:content) { should match /kolide: {"address":"0.0.0.0:8080","msg":"listening","transport":/ }
  its(:exit_status) { should eq 0 }
end
describe file('/var/log/messages'), :if => os[:family] == 'redhat' do
  its(:content) { should match /kolide: Using config file:/ }
  its(:content) { should match /kolide: {"component":"license-checker","msg":"starting"/ }
  its(:content) { should match /kolide: {"address":"0.0.0.0:8080","msg":"listening","transport":/ }
  its(:exit_status) { should eq 0 }
end


