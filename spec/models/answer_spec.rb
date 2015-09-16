describe Answer do

  it { should validate_length_of(:description) }
  it { should belong_to(:question) }

end
