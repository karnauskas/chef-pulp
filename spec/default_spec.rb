require "chefspec"

describe "pulp::default" do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it "does not raise an exception" do
    expect { chef_run }.to_not raise_error
  end
end
