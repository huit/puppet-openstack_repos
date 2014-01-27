require 'spec_helper'

describe 'openstack_repos', :type => :class do
  describe 'on RedHat platform' do
    let(:facts) { { :osfamily => 'RedHat' } }

    describe 'without role param' do

      it {
        expect { should raise_error(Puppet::Error, /Must pass role/) }
      }

    end

    describe 'with role param == compute' do
      let(:params) { { :role => 'compute' } }

      it { should compile.with_all_deps }

    end

    describe 'with role param == storage' do
      let(:params) { { :role => 'storage' } }

      it { should compile.with_all_deps }

    end

  end

  describe 'on Debian platform' do
    let(:facts) { { :osfamily => 'Debian' } }

    it {
      expect { should raise_error(Puppet::Error, /only runs on RedHat/) }
    }

  end
end
