package br.ufscar.dc.dsw.domain;

public class Capa {
    private Long id;
    private String caminho;
    private Long idLivro;

    public Capa(Long id, String caminho, Long idLivro) {
        this.id = id;
        this.caminho = caminho;
        this.idLivro = idLivro;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCaminho() {
        return caminho;
    }

    public void setCaminho(String caminho) {
        this.caminho = caminho;
    }

    public Long getIdLivro() {
        return idLivro;
    }

    public void setIdLivro(Long idLivro) {
        this.idLivro = idLivro;
    }
}
