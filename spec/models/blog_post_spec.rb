require 'spec_helper'

describe BlogPost do
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
  it { should validate_presence_of :user }
  it { should belong_to :user }
  it { should have_many :blog_comments }
end
