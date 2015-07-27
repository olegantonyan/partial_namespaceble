require 'spec_helper'

class User
  include ActiveModel::Conversion
  include PartialNamespaceble
end

class User::Profile
  include ActiveModel::Conversion
  include PartialNamespaceble
end

describe PartialNamespaceble do
  it 'has a version number' do
    expect(PartialNamespaceble::VERSION).not_to be nil
  end

  it 'returns correct partial path for namespaced model' do
    expect(User::Profile.new.to_partial_path).to eq('users/profiles/profile')
  end

  it 'returns correct partial path for non-namespaced model' do
    expect(User.new.to_partial_path).to eq('users/user')
  end

end
