# -*- encoding : utf-8 -*-
class Package < ActiveRecord::Base
  validates :title, :presence => true
  validates :extras, :presence => true
  validates :lectures, :presence => true, :numericality => true
  validates :teches, :presence => true, :numericality => true  
  validates :courses, :presence => true, :numericality => true
  validates :price, :presence => true, :numericality => true
end
