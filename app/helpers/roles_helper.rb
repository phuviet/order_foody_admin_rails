module RolesHelper
  def admin_id
    @admin_id ||= Role.find_by(name: 'Admin').id
  end

  def mod_id
    @mod_id ||= Role.find_by(name: 'Mod').id
  end

  def member_id
    @member_id ||= Role.find_by(name: 'Member').id
  end
end
