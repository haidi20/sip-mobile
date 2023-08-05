exports.login = (req, res) => {

  const data = {
    user: {
      id: 1,
      username: "haid",
      roleId: 1,
      roleName: "super admin",
    },
    token: "k23j4lk4",
    // token: null,
  }

  res.json({
    status: "success",
    data
  });
}