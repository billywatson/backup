# encoding: utf-8

require File.dirname(__FILE__) + '/../../spec_helper'

describe Backup::Configuration::Database::MySQL do
  before do
    Backup::Configuration::Database::MySQL.defaults do |db|
      db.name               = 'mydb'
      db.username           = 'myuser'
      db.password           = 'mypassword'
      db.host               = 'myhost'
      db.port               = 'myport'
      db.socket             = 'mysocket'
      db.skip_tables        = %w[my tables]
      db.only_tables        = %w[my other tables]
      db.additional_options = %w[my options]
    end
  end

  it 'should set the default MySQL configuration' do
    db = Backup::Configuration::Database::MySQL
    db.name.should               == 'mydb'
    db.username.should           == 'myuser'
    db.password.should           == 'mypassword'
    db.host.should               == 'myhost'
    db.port.should               == 'myport'
    db.socket.should             == 'mysocket'
    db.skip_tables.should        == %w[my tables]
    db.only_tables.should        == %w[my other tables]
    db.additional_options.should == %w[my options]
  end

  describe '#clear_defaults!' do
    it 'should clear all the defaults, resetting them to nil' do
      Backup::Configuration::Database::MySQL.clear_defaults!

      db = Backup::Configuration::Database::MySQL
      db.name.should               == nil
      db.username.should           == nil
      db.password.should           == nil
      db.host.should               == nil
      db.port.should               == nil
      db.socket.should             == nil
      db.skip_tables.should        == nil
      db.only_tables.should        == nil
      db.additional_options.should == nil
    end
  end
end
