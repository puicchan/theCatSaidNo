This is a azdev-ify Useful Website written in Flask for demo purposes and used in this blog post: https://techcommunity.microsoft.com/t5/apps-on-azure-blog/part-1-azdev-ify-what/ba-p/3644493.

The [Azure Developer CLI (azd)](https://aka.ms/azd) makes it quick and easy to get up and running on Azure by following a few conventions.  

Make sure you have an Azure account with an active subscription. [Create one for free](https://azure.microsoft.com/free/?WT.mc_id=A261C142F). You also need contributor role assigned to your Azure subscription. 

To deploy this useful website:
1. Install [azd](https://aka.ms/azd-install)
2. azd up -t https://github.com/puicchan/thecatsaidno
