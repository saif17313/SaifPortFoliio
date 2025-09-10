using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SaifPortFoliio.Admin
{
    public partial class Photography : System.Web.UI.Page
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
                LoadPhotos();
            }
        }

        private void LoadPhotos()
        {
            try
            {
                var photos = SaifPortFoliio.Db.GetAllPhotos();

                if (photos.Count > 0)
                {
                    rptPhotos.DataSource = photos;
                    rptPhotos.DataBind();
                    pnlEmpty.Visible = false;
                }
                else
                {
                    rptPhotos.DataSource = null;
                    rptPhotos.DataBind();
                    pnlEmpty.Visible = true;
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading photos: " + ex.Message, "danger");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                var photo = new SaifPortFoliio.Db.Photo
                {
                    Id = string.IsNullOrEmpty(hfPhotoId.Value) ? 0 : Convert.ToInt32(hfPhotoId.Value),
                    Name = txtName.Text.Trim(),
                    Description = txtDescription.Text.Trim(),
                    ImagePath = txtImagePath.Text.Trim()
                };

                bool success;
                string message;

                if (photo.Id == 0)
                {
                    int newId = SaifPortFoliio.Db.InsertPhoto(photo);
                    success = newId > 0;
                    message = success ? "Photo added successfully!" : "Failed to add photo.";
                }
                else
                {
                    success = SaifPortFoliio.Db.UpdatePhoto(photo);
                    message = success ? "Photo updated successfully!" : "Failed to update photo.";
                }

                if (success)
                {
                    ClearForm();
                    LoadPhotos();
                    ShowMessage(message, "success");
                }
                else
                {
                    ShowMessage(message, "danger");
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error saving photo: " + ex.Message, "danger");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        protected void rptPhotos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int photoId = Convert.ToInt32(e.CommandArgument);

            try
            {
                if (e.CommandName == "EditPhoto")
                {
                    var photos = SaifPortFoliio.Db.GetAllPhotos();
                    var photo = photos.FirstOrDefault(p => p.Id == photoId);

                    if (photo != null)
                    {
                        hfPhotoId.Value = photo.Id.ToString();
                        txtName.Text = photo.Name;
                        txtDescription.Text = photo.Description ?? "";
                        txtImagePath.Text = photo.ImagePath;

                        btnSave.Text = "Update Photo";
                        formTitle.Text = "Edit Photo";
                    }
                }
                else if (e.CommandName == "DeletePhoto")
                {
                    bool success = SaifPortFoliio.Db.DeletePhoto(photoId);
                    string message = success ? "Photo deleted successfully!" : "Failed to delete photo.";
                    string type = success ? "success" : "danger";

                    ShowMessage(message, type);

                    if (success)
                    {
                        LoadPhotos();
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
            hfPhotoId.Value = "0";
            txtName.Text = "";
            txtDescription.Text = "";
            txtImagePath.Text = "";
            btnSave.Text = "Add Photo";
            formTitle.Text = "Add New Photo";
        }

        private void ShowMessage(string message, string type)
        {
            lblMessage.Text = message;
            divMessage.Attributes["class"] = "alert alert-" + type;
            pnlMessage.Visible = true;
        }
    }
}
