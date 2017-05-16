//---------------------------------------------------------------------------

#ifndef BufferResumoOcorrenciasH
#define BufferResumoOcorrenciasH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TFBufferResumoOcorrencias : public TForm
{
__published:	// IDE-managed Components
    TListBox *ListBox1;
private:	// User declarations
public:		// User declarations
    __fastcall TFBufferResumoOcorrencias(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFBufferResumoOcorrencias *FBufferResumoOcorrencias;
//---------------------------------------------------------------------------
#endif
