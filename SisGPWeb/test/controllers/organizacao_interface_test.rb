require 'test_helper'

class OrganizacaoInterface < ActionController::TestCase

=begin
	describe OrganizacaoInterface do
		before :all do
		  @implementations =
		    ObjectSpace.each_object(Class)
		      .select { |klass| klass < OrganizacaoInterface }
		end

		it "should enforce that the interface is implemented" do
		  @implementations.each do |klass|
		    entity = klass.new
		    expect { entity.get_donos }.to not_raise
		  end
		end

	end
=end 
end