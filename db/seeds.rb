# Clear existing data
Comment.destroy_all
Deliverable.destroy_all
UserProject.destroy_all
Project.destroy_all
User.destroy_all
Company.destroy_all

# Seed companies
companies = 10.times.map do |i|
  Company.create!(
    name: "Company #{i + 1}",
    description: "Description for Company #{i + 1}",
    theme: "Theme #{i + 1}",
    logo_url: "https://via.placeholder.com/150?text=Logo+#{i + 1}"
  )
end

# Seed users
roles = %w[admin manager developer]

users = 10.times.map do |i|
  User.create!(
    name: "User #{i + 1}",
    email: "user#{i + 1}@example.com",
    password: "password",
    role: roles.sample,
    jti: SecureRandom.uuid
  )
end

# Seed projects
projects = 10.times.map do |i|
  Project.create!(
    name: "Project #{i + 1}",
    description: "Description for Project #{i + 1}",
    start_date: Date.today - rand(1..100).days,
    end_date: Date.today + rand(30..100).days,
    status: %w[active completed pending].sample,
    company: companies.sample
  )
end

# Seed user_projects
projects.each do |project|
  1.times do
    UserProject.create!(
      user: users.sample,
      project: project
    )
  end
end

# Seed deliverables
deliverables = 10.times.map do |i|
  Deliverable.create!(
    name: "Deliverable #{i + 1}",
    description: "Description for Deliverable #{i + 1}",
    due_date: Date.today + rand(5..30).days,
    status: %w[pending completed in_progress].sample,
    user: users.sample,
    project: projects.sample
  )
end

# Seed comments
10.times do |i|
  Comment.create!(
    content: "Comment #{i + 1} content",
    user: users.sample,
    deliverable: deliverables.sample
  )
end
