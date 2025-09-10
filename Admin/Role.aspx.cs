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
                    
                    // Add smooth refresh animation
                    string refreshScript = @"
                        setTimeout(function() {
                            var rolesTable = document.querySelector('.table-container');
                            if (rolesTable) {
                                rolesTable.style.transition = 'all 0.3s ease';
                                rolesTable.style.transform = 'scale(0.98)';
                                setTimeout(function() {
                                    rolesTable.style.transform = 'scale(1)';
                                }, 150);
                            }
                        }, 100);
                    ";
                    ClientScript.RegisterStartupScript(this.GetType(), "refreshAnimation", refreshScript, true);
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
                        
                        // Update form title using JavaScript since it's not a server control
                        string updateTitleScript = @"
                            var formTitle = document.getElementById('formTitle');
                            if (formTitle) {
                                formTitle.innerText = 'Edit Role';
                                formTitle.style.color = '#F59E0B';
                                setTimeout(function() {
                                    formTitle.style.color = '';
                                }, 2000);
                            }
                            
                            // Scroll to form smoothly
                            var formCard = document.querySelector('.admin-card');
                            if (formCard) {
                                formCard.scrollIntoView({ behavior: 'smooth', block: 'start' });
                                formCard.style.boxShadow = '0 20px 40px rgba(245, 158, 11, 0.15)';
                                setTimeout(function() {
                                    formCard.style.boxShadow = '';
                                }, 3000);
                            }
                        ";
                        ClientScript.RegisterStartupScript(this.GetType(), "updateTitle", updateTitleScript, true);
                        
                        ShowMessage("Role loaded for editing. Make your changes and click 'Update Role'.", "success");
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
                        
                        // Add smooth delete animation
                        string deleteScript = @"
                            setTimeout(function() {
                                var rolesTable = document.querySelector('.table-container');
                                if (rolesTable) {
                                    rolesTable.style.transition = 'all 0.5s ease';
                                    rolesTable.style.opacity = '0.7';
                                    setTimeout(function() {
                                        rolesTable.style.opacity = '1';
                                    }, 250);
                                }
                            }, 100);
                        ";
                        ClientScript.RegisterStartupScript(this.GetType(), "deleteAnimation", deleteScript, true);
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
            
            // Reset form title using JavaScript
            string resetTitleScript = @"
                var formTitle = document.getElementById('formTitle');
                if (formTitle) {
                    formTitle.innerText = 'Add New Role';
                    formTitle.style.color = '#5865F2';
                    setTimeout(function() {
                        formTitle.style.color = '';
                    }, 1000);
                }
            ";
            ClientScript.RegisterStartupScript(this.GetType(), "resetTitle", resetTitleScript, true);
        }

        private void ShowMessage(string message, string type)
        {
            lblMessage.Text = message;
            divMessage.Attributes["class"] = "alert alert-" + type;
            pnlMessage.Visible = true;
            
            // Add smooth message animation
            string messageScript = @"
                setTimeout(function() {
                    var messagePanel = document.getElementById('" + pnlMessage.ClientID + @"');
                    if (messagePanel) {
                        messagePanel.style.opacity = '0';
                        messagePanel.style.transform = 'translateY(-10px)';
                        messagePanel.style.transition = 'all 0.3s ease';
                        
                        setTimeout(function() {
                            messagePanel.style.opacity = '1';
                            messagePanel.style.transform = 'translateY(0)';
                        }, 50);
                        
                        // Auto-hide after 5 seconds
                        setTimeout(function() {
                            messagePanel.style.opacity = '0';
                            messagePanel.style.transform = 'translateY(-10px)';
                            setTimeout(function() {
                                messagePanel.style.display = 'none';
                            }, 300);
                        }, 5000);
                    }
                }, 100);
            ";
            ClientScript.RegisterStartupScript(this.GetType(), "messageAnimation", messageScript, true);
        }
    }
}
