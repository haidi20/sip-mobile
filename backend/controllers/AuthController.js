exports.login = (req, res) => {

  const data = {
    id: 1,
    username: "haid",
    roleId: 1,
    roleName: "super admin",
    token: "k23j4lk4",
  }

  res.json({
    success: true,
    data
  });
}