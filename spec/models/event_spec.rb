require 'rails_helper'

RSpec.describe Event, type: :model do	
	context 'validations' do 
   it { should validate_presence_of :event_type  }   
   it { should belong_to(:repo) }   
   it { should belong_to(:actor) }   
	end	
end
