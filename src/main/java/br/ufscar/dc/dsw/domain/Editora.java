package br.ufscar.dc.dsw.domain;

public class Editora {
    private long id;
    private String CNPJ;
    private String nome;

    public Editora(long id){
        id = this.id;
    }

    public Editora(String CPNJ, String nome){
        this.CNPJ = CPNJ;
        this.nome = nome;
    }

    public Editora(Long id, String CNPJ, String nome) {
        this(CNPJ, nome);
        this.id = id;
    }

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public String getCNPJ() {
        return CNPJ;
    }
    public void setCNPJ(String CNPJ) {
        this.CNPJ = CNPJ;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome){
        this.nome = nome;
    }



}
