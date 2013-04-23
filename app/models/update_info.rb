class UpdateInfo < ActiveRecord::Base
  attr_accessible :device_name, :note, :update_deadline_at, :update_method, :update_start_at
end
