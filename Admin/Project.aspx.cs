using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SaifPortFoliio.Admin
{
    public partial class Project : System.Web.UI.Page
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
                LoadProjects();
            }
        }

        private void LoadProjects()
        {
            try
            {
                var projects = SaifPortFoliio.Db.GetAllProjects();
                gvProjects.DataSource = projects;
                gvProjects.DataBind();
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading projects: " + ex.Message, "danger");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                var project = new SaifPortFoliio.Db.Project
                {
                    Id = string.IsNullOrEmpty(hfProjectId.Value) ? 0 : Convert.ToInt32(hfProjectId.Value),
                    Title = txtTitle.Text.Trim(),
                    Slug = txtSlug.Text.Trim(),
                    ShortDescription = txtDescription.Text.Trim(),
                    CoverImagePath = txtCoverImagePath.Text.Trim(),
                    LiveUrl = txtLiveUrl.Text.Trim(),
                    RepoUrl = txtRepoUrl.Text.Trim()
                };

                bool success;
                string message;

                if (project.Id == 0)
                {
                    int newId = SaifPortFoliio.Db.InsertProject(project);
                    success = newId > 0;
                    message = success ? "Project added successfully!" : "Failed to add project.";
                }
                else
                {
                    success = SaifPortFoliio.Db.UpdateProject(project);
                    message = success ? "Project updated successfully!" : "Failed to update project.";
                }

                if (success)
                {
                    ClearForm();
                    LoadProjects();
                    ShowMessage(message, "success");
                }
                else
                {
                    ShowMessage(message, "danger");
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error saving project: " + ex.Message, "danger");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        protected void gvProjects_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int projectId = Convert.ToInt32(e.CommandArgument);

            try
            {
                if (e.CommandName == "EditProject")
                {
                    var project = SaifPortFoliio.Db.GetProjectById(projectId);
                    if (project != null)
                    {
                        hfProjectId.Value = project.Id.ToString();
                        txtTitle.Text = project.Title;
                        txtSlug.Text = project.Slug;
                        txtDescription.Text = project.ShortDescription ?? "";
                        txtCoverImagePath.Text = project.CoverImagePath ?? "";
                        txtLiveUrl.Text = project.LiveUrl ?? "";
                        txtRepoUrl.Text = project.RepoUrl ?? "";

                        btnSave.Text = "Update Project";
                        formTitle.Text = "Edit Project";
                    }
                }
                else if (e.CommandName == "DeleteProject")
                {
                    bool success = SaifPortFoliio.Db.DeleteProject(projectId);
                    string message = success ? "Project deleted successfully!" : "Failed to delete project.";
                    string type = success ? "success" : "danger";

                    ShowMessage(message, type);

                    if (success)
                    {
                        LoadProjects();
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
            hfProjectId.Value = "0";
            txtTitle.Text = "";
            txtSlug.Text = "";
            txtDescription.Text = "";
            txtCoverImagePath.Text = "";
            txtLiveUrl.Text = "";
            txtRepoUrl.Text = "";
            btnSave.Text = "Add Project";
            formTitle.Text = "Add New Project";
        }

        private void ShowMessage(string message, string type)
        {
            lblMessage.Text = message;
            divMessage.Attributes["class"] = "alert alert-" + type;
            pnlMessage.Visible = true;
        }
    }
}
