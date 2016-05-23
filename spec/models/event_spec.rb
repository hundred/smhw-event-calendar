require 'rails_helper'

RSpec.describe Event do
  subject(:event) { FactoryGirl.create(:event) }

  it { should be_valid }
  it { should respond_to(:title) }
  it { should respond_to(:info) }
  it { should respond_to(:description) }
  it { should respond_to(:start_time) }
  it { should respond_to(:end_time) }

end
