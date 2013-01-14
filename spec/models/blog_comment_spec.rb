require 'spec_helper'

describe BlogComment do
  it { should validate_presence_of :content }
  it { should validate_presence_of :user }
  it { should belong_to :user }
  it { should belong_to :blog_post }
end
