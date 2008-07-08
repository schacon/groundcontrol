#! /usr/bin/env ruby

require File.join(File.dirname(__FILE__), '..', 'config', 'environment')

require 'yaml'
require 'pp'

require 'rubygems'
require 'mechanize'

settings = YAML::load( File.open(File.join(File.dirname(__FILE__), "settings.yml")) )

webapp = Host.find(:first)
role = Role.find(:first)

pp role
order = 0
settings['urls']['webapp'].to_a.sort.each do |section, pages_arr|

  pages_arr.each do |path_data|
    order += 1
    cnt, section_name = section.split('_')
    route, lookfor = path_data.split(' ')

    p             = Page.new
    p.uri_pattern = route
    p.role        = role
    p.order       = order
    p.variables   = lookfor.gsub('[', '').gsub(']', '') if lookfor
    p.section     = section_name
    p.save
    pp p
  end
  
end

