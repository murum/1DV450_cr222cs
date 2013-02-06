# encoding: utf-8

class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :email_confirmation
  
  has_many :projects
  has_many :tickets
  has_and_belongs_to_many :projects
  
  validates :first_name, 
            :presence => { :message => "Du måste ange ett förnamn" }              
  validates :last_name,
            :presence => { :message => "Du måste ange ett efternamn" }
  validates :email,
            :presence => { :message => "Du måste ange en email adress" },
            :uniqueness => { :case_sensitive => false , :message => "Emailadressen är redan registrerad"},
            :confirmation => { :message => "Emailadressen stämmer inte överens" }
  validates :email_confirmation,
            :presence => { :message => "Du måste ange emailadressen två gånger." }
  validates :password,
            :presence => { :message => "Du måste ange ett lösenord" },
            :confirmation => { :message => "Lösenorden stämmer inte överens" }
  validates :password_confirmation,
            :presence => { :message => "Du måste ange lösenordet två gånger." }
end
