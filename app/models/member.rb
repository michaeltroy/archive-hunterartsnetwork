require 'digest/sha2'

class Member < ActiveRecord::Base
  
  acts_as_viewable
  
  ## Relationships
  has_many :articles
  has_many :events
  has_many :artworks, :dependent => :destroy
  has_many :sessions
  
  ## Validations
  validates_presence_of :number, :username, :email, :firstname, :surname
  validates_confirmation_of :email
  validates_uniqueness_of :username, :number, :email
  validates_length_of :username, :minimum => 5
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\Z/i
  
  attr_protected :id, :salt

  attr_accessor :password, :password_confirmation
  
  def password
    @password
  end
  
  # Password generation
  def password=(pass)
    @password = pass
    salt = [Array.new(6){rand(256).chr}.join].pack("m").chomp
    self.pass_salt, self.pass_hash = 
    salt, Digest::SHA256.hexdigest(pass + salt)
  end
  
  # Authenticate member
  def self.authenticate(username, pass)
    member = Member.find(:first, :conditions => ['username = ?', username])
      if member.blank? || Digest::SHA256.hexdigest(pass + member.pass_salt) != member.pass_hash
        raise "Your username or password are invalid"
      end
    member
  end
  
  def self.check_member(email)
    member = Member.find(:first, :conditions => ['email = ?', email])
  end
  
  ## Find and sort direct from ActiveRecord
  def self.ceramics
    Member.find(:all, :conditions => ['category = ? and medium = ? and public =?', 
                                      'artist','ceramics', 1])
  end
  
  def self.jewellery
    Member.find(:all, :conditions => ['category = ? and medium = ? and public =?', 
                                      'artist', 'jewellery', 1])
  end
  
  def self.mixed_media
    Member.find(:all, :conditions => ['category = ? and medium = ? and public =?', 
                                      'artist', 'mixed media', 1])
  end
  
  def self.painting
    Member.find(:all, :conditions => ['category = ? and medium = ? and public =?', 
                                      'artist', 'painting', 1])
  end
  
  def self.textiles
    Member.find(:all, :conditions => ['category = ? and medium = ? and public =?', 
                                      'artist', 'textiles', 1])
  end
  
  def self.works_on_paper
    Member.find(:all, :conditions => ['category = ? and medium = ? and public =?', 
                                      'artist','works on paper', 1])
  end
  
  def self.other
    Member.find(:all, :conditions => ['category = ? and medium = ? and public = ?', 
                                      'artist', 'other', 1])
  end
  
  def self.other_member
    Member.find(:all, :conditions => ['category != ? and public = ?', 'artist', 1])
  end
  
  protected
  # Generate new random password
  def self.generate_random_password(len)
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass
  end
  
end