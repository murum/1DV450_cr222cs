# -*- encoding : utf-8 -*-
module ProjectsHelper
  
  def add_project_user (project, user)
    project.users << user
    redirect_to project_path project
  end
  
  def get_member_projects(projects)
    userProjects = Array.new
    projects.each do |project|
      if(project.users.where(['user_id = ?', current_user.id]).all.any?)
        userProjects << project
      end
    end
    return userProjects
  end
  
  def is_project_member(project_id)
    project = Project.find(project_id)
    if (project.users.where(['user_id = ?', current_user.id]).all.any?)
      return project
    else 
      return false
    end
  end
  
  def is_logged_as_owner(project_owner_id)
    if current_user
      if current_user.id == project_owner_id
        return true
      end
    end
  end
  
  def is_owner(owner_id, user_id)
    if owner_id == user_id
      return true
    end
  end
end
