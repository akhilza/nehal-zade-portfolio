Add-Type -AssemblyName System.Drawing

$source = @"
using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing.Text;

public class ResumeRenderer
{
    private Bitmap bmp;
    private Graphics g;
    private float y;
    private float margin = 70f;
    private float contentWidth;
    private float pageHeight = 2021f;

    private SolidBrush brushDark = new SolidBrush(Color.FromArgb(25, 30, 36));
    private SolidBrush brushMuted = new SolidBrush(Color.FromArgb(85, 95, 110));
    private SolidBrush brushBannerBg = new SolidBrush(Color.FromArgb(232, 244, 245));
    private SolidBrush brushBannerText = new SolidBrush(Color.FromArgb(20, 50, 70));

    private Font fontTitle = new Font("Segoe UI", 26f, FontStyle.Bold);
    private Font fontRole = new Font("Segoe UI", 13.5f, FontStyle.Bold);
    private Font fontContact = new Font("Segoe UI", 10.5f, FontStyle.Regular);
    private Font fontBanner = new Font("Segoe UI", 11.5f, FontStyle.Bold);
    private Font fontItemTitle = new Font("Segoe UI", 11f, FontStyle.Bold);
    private Font fontItemSub = new Font("Segoe UI", 10.5f, FontStyle.Regular);
    private Font fontBody = new Font("Segoe UI", 9.6f, FontStyle.Regular);
    private Font fontBodyBold = new Font("Segoe UI", 9.6f, FontStyle.Bold);

    public ResumeRenderer()
    {
        bmp = new Bitmap(1429, 2021);
        g = Graphics.FromImage(bmp);
        g.SmoothingMode = SmoothingMode.AntiAlias;
        g.TextRenderingHint = TextRenderingHint.ClearTypeGridFit;
        g.InterpolationMode = InterpolationMode.HighQualityBicubic;
        g.Clear(Color.White);
        contentWidth = 1429f - (margin * 2f);
        y = 55f;
    }

    public void DrawHeader(string name, string role, string contact1, string contact2)
    {
        g.DrawString(name, fontTitle, brushDark, margin, y);
        y += 40f;
        g.DrawString(role, fontRole, brushDark, margin, y);
        y += 24f;
        g.DrawString(contact1, fontContact, brushMuted, margin, y);
        y += 20f;
        g.DrawString(contact2, fontContact, brushMuted, margin, y);
        y += 26f;
    }

    public void DrawBanner(string title)
    {
        y += 6f;
        float bannerHeight = 26f;
        g.FillRectangle(brushBannerBg, margin, y, contentWidth, bannerHeight);
        g.DrawString(title, fontBanner, brushBannerText, margin + 8f, y + 3.5f);
        y += bannerHeight + 8f;
    }

    public void DrawParagraph(string text)
    {
        SizeF size = g.MeasureString(text, fontBody, (int)contentWidth);
        RectangleF rect = new RectangleF(margin, y, contentWidth, size.Height + 5f);
        g.DrawString(text, fontBody, brushDark, rect);
        y += size.Height + 6f;
    }

    public void DrawJobHeader(string title, string date, string company)
    {
        g.DrawString(title, fontItemTitle, brushDark, margin, y);
        StringFormat sfRight = new StringFormat { Alignment = StringAlignment.Far };
        g.DrawString(date, fontItemTitle, brushDark, new RectangleF(margin, y, contentWidth, 22f), sfRight);
        y += 18f;
        g.DrawString(company, fontItemSub, brushMuted, margin, y);
        y += 18f;
    }

    public void DrawProjectHeader(string project, string environment)
    {
        g.DrawString(project, fontItemTitle, brushDark, margin, y);
        y += 18f;
        g.DrawString(environment, fontBodyBold, brushMuted, margin, y);
        y += 18f;
    }

    public void DrawBullet(string text, float lineSpacing = 2.5f)
    {
        float bulletWidth = 16f;
        g.DrawString("•", fontBodyBold, brushDark, margin + 2f, y);
        float textWidth = contentWidth - bulletWidth;
        SizeF size = g.MeasureString(text, fontBody, (int)textWidth);
        RectangleF rect = new RectangleF(margin + bulletWidth, y, textWidth, size.Height + 4f);
        g.DrawString(text, fontBody, brushDark, rect);
        y += size.Height + lineSpacing;
    }

    public void DrawEducationItem(string degree, string institution)
    {
        g.DrawString(degree, fontItemTitle, brushDark, margin, y);
        y += 18f;
        g.DrawString(institution, fontItemSub, brushMuted, margin, y);
        y += 18f;
    }

    public void AddSpace(float pixels)
    {
        y += pixels;
    }

    public float GetCurrentY()
    {
        return y;
    }

    public void Save(string path)
    {
        bmp.Save(path, ImageFormat.Png);
        g.Dispose();
        bmp.Dispose();
    }
}
"@

Add-Type -TypeDefinition $source -ReferencedAssemblies "System.Drawing.dll"

Write-Output "ResumeRenderer type compiled successfully."
