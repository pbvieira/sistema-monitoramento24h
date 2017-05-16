//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USEFORM("monitor.cpp", FMonitor);
USEFORM("dmazsim.cpp", DModule); /* TDataModule: File Type */
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
        try
        {
             Application->Initialize();
             Application->Title = "AZSIM-MONITOR";
             Application->CreateForm(__classid(TDModule), &DModule);
             Application->CreateForm(__classid(TFMonitor), &FMonitor);
             Application->Run();
        }
        catch (Exception &exception)
        {
             Application->ShowException(&exception);
        }
        catch (...)
        {
             try
             {
                     throw Exception("");
             }
             catch (Exception &exception)
             {
                     Application->ShowException(&exception);
             }
        }
        return 0;
}
//---------------------------------------------------------------------------
