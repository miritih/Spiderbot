describe "Response concern" do
  include Response
  let!(:employer) { create :employer }
  describe "Render response" do
    context "When block is passed" do
      it "renders resource as json" do
        response = render_response(EmployerSerializer, employer) do
          { employer: employer, status: :ok }
          binding.pry

        end
        expect(response[:employer][:id]).to eq employer.id
      end
    end
  end

  describe "Render error response" do
    context "When block is passed" do
      it "renders resource as json" do
        response = render_error_response(employer) do
          { employer: employer, status: :ok }
        end
        expect(response[:employer][:id]).to eq employer.id
      end
    end
  end
end
