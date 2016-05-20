# -*- encoding : utf-8 -*-
class Activity < ActiveRecord::Base
  belongs_to :course
  belongs_to :tech
  belongs_to :lecture
  belongs_to :extra
  belongs_to :user
end
