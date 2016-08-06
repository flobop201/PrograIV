using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

namespace UAMShop.mantenimiento
{
    public partial class mantproductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnVerProductos_Click(object sender, EventArgs e)
        {
            lblResultadoAgregarProducto.Text = "";
            lblResultadoAgregarProducto.Text = "";
            lblErrorModificarProducto.Text = "";
            lblerrorverproducto.Text = "";
            try
            {
                MultiViewProductos.ActiveViewIndex = 0;
                GridViewVerProductos.Visible = true;
                GridViewVerProductos.DataBind();
            }
            catch (Exception ex)
            {
                lblerrorverproducto.ForeColor = System.Drawing.Color.Red;
                lblerrorverproducto.Text = "Error: El siguiente error ocurrió: " + ex.Message;
                lblerrorverproducto.Visible = true;
                Log4NetModule.Log4Net.WriteLog(ex, Log4NetModule.Log4Net.LogType.Error);
            }
            
            
        }

        protected void btnModificarProductos_Click(object sender, EventArgs e)
        {
            lblResultadoAgregarProducto.Text = "";
            lblErrorModificarProducto.Text = "";
            lblerrorverproducto.Text = "";
            lblResultadoAgregarProducto.Text = "";
            try
            {
                MultiViewProductos.ActiveViewIndex = 2;
                GridViewModificarProductos.Visible = true;
                GridViewModificarProductos.DataBind();
            }
            catch (Exception ex)
            {
                lblErrorModificarProducto.ForeColor = System.Drawing.Color.Red;
                lblErrorModificarProducto.Text = "Error: El siguiente error ocurrió: " + ex.Message;
                lblErrorModificarProducto.Visible = true;
                Log4NetModule.Log4Net.WriteLog(ex, Log4NetModule.Log4Net.LogType.Error);
            }
            
            
        }

        protected void btnAgregarProductos_Click(object sender, EventArgs e)
        {
            lblResultadoAgregarProducto.Text = "";
            lblErrorModificarProducto.Text = "";
            lblerrorverproducto.Text = "";
            lblResultadoAgregarProducto.Text = "";
            try
            {
                MultiViewProductos.ActiveViewIndex = 1;
                lblProductos.Visible = true;
                FileUploadAgregarProducto.Visible = true;
            }
            catch (Exception ex)
            {
                lblResultadoAgregarProducto.ForeColor = System.Drawing.Color.Red;
                lblResultadoAgregarProducto.Text = "Error: El siguiente error ocurrió: " + ex.Message;
                lblResultadoAgregarProducto.Visible = true;
                Log4NetModule.Log4Net.WriteLog(ex, Log4NetModule.Log4Net.LogType.Error);
            }
            
        }

        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            lblErrorCodigo.Visible = false;
            lblErrorNombre.Visible = false;
            lblErrorExistencia.Visible = false;
            lblErrorPrecio.Visible = false;

            if (FileUploadAgregarProducto.HasFile)
            {
                try
                {
                    if (FileUploadAgregarProducto.PostedFile.ContentType == "image/png")
                    {

                        if (!string.IsNullOrWhiteSpace(txtbAgregarCodigoProducto.Text) && !string.IsNullOrWhiteSpace(txtbAgregarNombreProducto.Text) && System.Text.RegularExpressions.Regex.IsMatch(txtbAgregarExistenciaProducto.Text, "[ ^ 0-9]") && System.Text.RegularExpressions.Regex.IsMatch(txtbAgregarPrecioProducto.Text, "[ ^ 0-9]"))
                        {
                            SqlDataSourceProductos.InsertParameters.Add("Codigo", txtbAgregarCodigoProducto.Text);
                            SqlDataSourceProductos.InsertParameters.Add("Producto", txtbAgregarNombreProducto.Text);
                            SqlDataSourceProductos.InsertParameters.Add("Existencia", txtbAgregarExistenciaProducto.Text);
                            SqlDataSourceProductos.InsertParameters.Add("Precio", txtbAgregarPrecioProducto.Text);
                            SqlDataSourceProductos.InsertParameters.Add("IdCategoria", DropDownListCategorias.SelectedItem.Value);
                            string filename = (txtbAgregarCodigoProducto.Text + ".png");
                            SqlDataSourceProductos.InsertParameters.Add("Imagen", ("../img/productos/") + filename);
                            FileUploadAgregarProducto.SaveAs(Server.MapPath("../img/productos/") + filename);
                            SqlDataSourceProductos.Insert();
                            lblResultadoAgregarProducto.ForeColor = System.Drawing.Color.Black;
                            lblResultadoAgregarProducto.Text = "Producto cargado satisfactoriamente!";
                            lblResultadoAgregarProducto.Visible = true;
                            txtbAgregarCodigoProducto.Text = "";
                            txtbAgregarNombreProducto.Text = "";
                            txtbAgregarExistenciaProducto.Text = "";
                            txtbAgregarPrecioProducto.Text = "";
                        }

                        else
                        {
                            if (string.IsNullOrWhiteSpace(txtbAgregarCodigoProducto.Text))
                            {
                                lblErrorCodigo.ForeColor = System.Drawing.Color.Red;
                                lblErrorCodigo.Text = "Codigo es necesario!";
                                lblErrorCodigo.Visible = true;
                            }


                            if (string.IsNullOrWhiteSpace(txtbAgregarNombreProducto.Text))
                            {
                                lblErrorNombre.ForeColor = System.Drawing.Color.Red;
                                lblErrorNombre.Text = "Nombre es necesario!";
                                lblErrorNombre.Visible = true;
                            }
                            if (string.IsNullOrWhiteSpace(txtbAgregarExistenciaProducto.Text))
                            {
                                lblErrorExistencia.ForeColor = System.Drawing.Color.Red;
                                lblErrorExistencia.Text = "Existencias es necesario!";
                                lblErrorExistencia.Visible = true;
                            }
                            else
                            {
                                if (!System.Text.RegularExpressions.Regex.IsMatch(txtbAgregarExistenciaProducto.Text, "[ ^ 0-9]"))
                                {
                                    lblErrorExistencia.ForeColor = System.Drawing.Color.Red;
                                    lblErrorExistencia.Text = "Solo numeros son permitidos!";
                                    lblErrorExistencia.Visible = true;
                                }
                                if (!System.Text.RegularExpressions.Regex.IsMatch(txtbAgregarCodigoProducto.Text, "[ ^ 0-9]"))
                                {
                                    lblErrorCodigo.ForeColor = System.Drawing.Color.Red;
                                    lblErrorCodigo.Text = "Solo numeros son permitidos!";
                                    lblErrorCodigo.Visible = true;
                                }
                            }

                            if (string.IsNullOrWhiteSpace(txtbAgregarPrecioProducto.Text))
                            {
                                lblErrorPrecio.ForeColor = System.Drawing.Color.Red;
                                lblErrorPrecio.Text = "Precio es necesario!";
                                lblErrorPrecio.Visible = true;
                            }
                            else 
                            {
                                if (!System.Text.RegularExpressions.Regex.IsMatch(txtbAgregarPrecioProducto.Text, "[ ^ 0-9]"))
                                {
                                    lblErrorPrecio.ForeColor = System.Drawing.Color.Red;
                                    lblErrorPrecio.Text = "Solo numeros son permitidos!";
                                    lblErrorPrecio.Visible = true;
                                }
                            }
                        }
                    }
                    else
                    {
                        lblResultadoAgregarProducto.ForeColor = System.Drawing.Color.Red;
                        lblResultadoAgregarProducto.Text = "Error: Solo formato .png es permitido!";
                        lblResultadoAgregarProducto.Visible = true;
                    }
                }
                catch (Exception ex)
                {
                    lblResultadoAgregarProducto.ForeColor = System.Drawing.Color.Red;
                    lblResultadoAgregarProducto.Text = "Error al ingresar el producto: El siguiente error ocurrió: " + ex.Message;
                    lblResultadoAgregarProducto.Visible = true;
                    Log4NetModule.Log4Net.WriteLog(ex, Log4NetModule.Log4Net.LogType.Error);
                }

            }
            else 
            {
                lblResultadoAgregarProducto.Text = "Incluir una imagen es obligatorio";
                lblResultadoAgregarProducto.ForeColor = System.Drawing.Color.Red;
                lblResultadoAgregarProducto.Visible = true;
            } 

            
        }

        protected void DropDownListCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        protected void DataGrid1_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.EditItem)
                {
                    DropDownList dropDownList1 = (DropDownList)e.Item.FindControl("Dropdownlist1");
                    DataRowView dataItem1 = (DataRowView)e.Item.DataItem;
                    dropDownList1.SelectedValue = (string)dataItem1.Row["IdCategoria"];
                }
            }
            catch (Exception ex)
            {
                lblResultadoAgregarProducto.ForeColor = System.Drawing.Color.Red;
                lblResultadoAgregarProducto.Text = "Error: El siguiente error ocurrió: " + ex.Message;
                Log4NetModule.Log4Net.WriteLog(ex, Log4NetModule.Log4Net.LogType.Error);
            }
            
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                FileUpload fileUpload = GridViewModificarProductos.Rows[e.RowIndex].FindControl("FileUpload1") as FileUpload;
                fileUpload.SaveAs(Server.MapPath("../img/productos/") + fileUpload.FileName);
                SqlDataSourceProductos.UpdateParameters["Imagen"].DefaultValue = "../img/productos/" + fileUpload.FileName;
            }
            catch (Exception ex)
            {
                lblErrorModificarProducto.ForeColor = System.Drawing.Color.Red;
                lblErrorModificarProducto.Text = "Error: El siguiente error ocurrió: " + ex.Message;
                Log4NetModule.Log4Net.WriteLog(ex, Log4NetModule.Log4Net.LogType.Error);
            }
            
        }

        protected void DropDownListCategorias_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }


    }
}