using System;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace SaifPortFoliio.Admin
{
    public partial class Skill : System.Web.UI.Page
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
                LoadSkills();
            }
        }

        private void LoadSkills()
        {
            try
            {
                var skills = SaifPortFoliio.Db.GetAllSkills();
                gvSkills.DataSource = skills;
                gvSkills.DataBind();
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading skills: " + ex.Message, "danger");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                var skill = new SaifPortFoliio.Db.Skill
                {
                    Id = string.IsNullOrEmpty(hfSkillId.Value) ? 0 : Convert.ToInt32(hfSkillId.Value),
                    Name = txtName.Text.Trim(),
                    Category = txtCategory.Text.Trim(),
                    LevelPercent = string.IsNullOrEmpty(txtLevelPercent.Text) ? (int?)null : Convert.ToInt32(txtLevelPercent.Text)
                };

                bool success;
                string message;

                if (skill.Id == 0)
                {
                    int newId = SaifPortFoliio.Db.InsertSkill(skill);
                    success = newId > 0;
                    message = success ? "Skill added successfully!" : "Failed to add skill.";
                }
                else
                {
                    success = SaifPortFoliio.Db.UpdateSkill(skill);
                    message = success ? "Skill updated successfully!" : "Failed to update skill.";
                }

                if (success)
                {
                    ClearForm();
                    LoadSkills();
                    ShowMessage(message, "success");
                }
                else
                {
                    ShowMessage(message, "danger");
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error saving skill: " + ex.Message, "danger");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        protected void gvSkills_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int skillId = Convert.ToInt32(e.CommandArgument);

            try
            {
                if (e.CommandName == "EditSkill")
                {
                    var skills = SaifPortFoliio.Db.GetAllSkills();
                    var skill = skills.FirstOrDefault(s => s.Id == skillId);

                    if (skill != null)
                    {
                        hfSkillId.Value = skill.Id.ToString();
                        txtName.Text = skill.Name;
                        txtCategory.Text = skill.Category ?? "";
                        txtLevelPercent.Text = skill.LevelPercent?.ToString() ?? "";

                        btnSave.Text = "Update Skill";
                        formTitle.Text = "Edit Skill";
                    }
                }
                else if (e.CommandName == "DeleteSkill")
                {
                    bool success = SaifPortFoliio.Db.DeleteSkill(skillId);
                    string message = success ? "Skill deleted successfully!" : "Failed to delete skill.";
                    string type = success ? "success" : "danger";

                    ShowMessage(message, type);

                    if (success)
                    {
                        LoadSkills();
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message, "danger");
            }
        }

        protected void gvSkills_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Optional: you can add row-level formatting here
            }
        }

        private void ClearForm()
        {
            hfSkillId.Value = "0";
            txtName.Text = "";
            txtCategory.Text = "";
            txtLevelPercent.Text = "";
            btnSave.Text = "Add Skill";
            formTitle.Text = "Add New Skill";
        }

        private void ShowMessage(string message, string type)
        {
            lblMessage.Text = message;
            divMessage.Attributes["class"] = "alert alert-" + type;
            pnlMessage.Visible = true;
        }
    }
}
