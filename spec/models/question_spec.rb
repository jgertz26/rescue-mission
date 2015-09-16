describe Question do

  it { should validate_length_of(:body) }
  it { should validate_length_of(:description) }
  it { should have_many(:answers) }

end
