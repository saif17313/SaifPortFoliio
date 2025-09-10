using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SaifPortFoliio.Admin
{
    public partial class Role : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdminLoggedIn"] == null || !(bool)Session["IsAdminLoggedIn"])
            {
                Response.Redirect("../AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadRoles();
            }
        }

        private void LoadRoles()
        {
            try
            {
                var roles = SaifPortFoliio.Db.GetAllRoles();
                gvRoles.DataSource = roles;
                gvRoles.DataBind();
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading roles: " + ex.Message, "danger");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string roleText = txtRoleText.Text.Trim();
                int roleId = string.IsNullOrEmpty(hfRoleId.Value) ? 0 : Convert.ToInt32(hfRoleId.Value);

                bool success;
                string message;

                if (roleId == 0)
                {
                    int newId = SaifPortFoliio.Db.InsertRole(roleText);
                    success = newId > 0;
                    message = success ? "Role added successfully!" : "Failed to add role.";
                }
                else
                {
                    success = SaifPortFoliio.Db.UpdateRole(roleId, roleText);
                    message = success ? "Role updated successfully!" : "Failed to update role.";
                }

                if (success)
                {
                    ClearForm();
                    LoadRoles();
                    ShowMessage(message, "success");
                }
                else
                {
                    ShowMessage(message, "danger");
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error saving role: " + ex.Message, "danger");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        protected void gvRoles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int roleId = Convert.ToInt32(e.CommandArgument);

            try
            {
                if (e.CommandName == "EditRole")
                {
                    var roles = SaifPortFoliio.Db.GetAllRoles();
                    var role = roles.FirstOrDefault(r => r.Id == roleId);

                    if (role != null)
                    {
                        hfRoleId.Value = role.Id.ToString();
                        txtRoleText.Text = role.RoleText;

                        btnSave.Text = "Update Role";
                        formTitle.Text = "Edit Role";
                    }
                }
                else if (e.CommandName == "DeleteRole")
                {
                    bool success = SaifPortFoliio.Db.DeleteRole(roleId);
                    string message = success ? "Role deleted successfully!" : "Failed to delete role.";
                    string type = success ? "success" : "danger";

                    ShowMessage(message, type);

                    if (success)
                    {
                        LoadRoles();
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message, "danger");
            }
        }

        private void ClearForm()
        {
            hfRoleId.Value = "0";
            txtRoleText.Text = "";
            btnSave.Text = "Add Role";
            formTitle.Text = "Add New Role";
        }

        private void ShowMessage(string message, string type)
        {
            lblMessage.Text = message;
            divMessage.Attributes["class"] = "alert alert-" + type;
            pnlMessage.Visible = true;
        }
    }
}
