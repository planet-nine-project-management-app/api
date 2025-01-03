json.company do
    json.id @company.id
    json.name @company.name
    json.projects @company.projects do |project|
        json.id project.id
        json.name project.name
    end
end

json.message 'Success'
json.status STATUS_CODES[:ok]