# Traspaso: proyecto del libro de estoicismo

Pega este archivo, o pide que lo lean, al iniciar la nueva sesión de Claude Code en tu PC.

## Contexto

Libro de estoicismo práctico basado en las *Meditaciones* de Marco Aurelio, para publicar en Amazon KDP. Autor: **Francisco Javier Ballesteros**.

| Edición | Título | Carpeta | Estado |
|---|---|---|---|
| Español (México/LatAm) | *Lo que depende de ti* | `libro-lo-que-depende-de-ti/` | Completa, corregida (243 págs., 6 × 9) |
| Inglés (EE. UU., localizada) | *Within Your Power* | `libro-within-your-power/` | Reescritura nativa completa + auditoría aplicada (245 págs.) |

Cada edición tiene un archivo `.md` por sección (`00-*.md` a `18-*.md`), y el Word y el Markdown completos se generan con:

```
pandoc 0*.md 1*.md -o <archivo>.docx --toc --toc-depth=1
```

(En la sesión anterior se usó un `reference.docx` con página de 6 × 9, Georgia 11.5 pt, interlineado 1.3 y títulos en gris oscuro con salto de página antes de cada H1. Si se pierde, se puede regenerar con `pandoc --print-default-data-file reference.docx` y python-docx.)

## Skills del repo (`.claude/skills/`)

- `escritor-filosofo`: redacción con mirada filosófica.
- `filosofo-divulgador`: dictamen editorial y filosófico.
- `traductor-adaptador-bilingue`: traducción y localización ES ↔ EN con revisión en cuatro pasadas.

## Documentos clave

- `libro-within-your-power/HOJA-DE-ESTILO-within-your-power.md`: glosario, personajes, localización y cronología.
- `libro-lo-que-depende-de-ti/DICTAMEN-filosofo-divulgador.md`: dictamen inicial (ya aplicado).
- `libro-within-your-power/PROMPT-evaluacion-nativa.md`: prompt para que otra IA evalúe el inglés.
- `libro-within-your-power/BRIEF-para-Codex-portada-y-pendientes.md`: brief para discutir la portada y el lanzamiento con Codex.
- `libro-lo-que-depende-de-ti/PROMPTS-portada.md`: prompts de portada (busto con selfie, tienda de campaña, moneda).
- `libro-within-your-power/Within-Your-Power-COMPLETO.zip`: paquete completo en inglés (incluye la auditoría externa).

## Reglas que no se deben romper

- **Prólogo y notas del autor:** voz real del autor. No inventar detalles de su vida. Sobre su padre, solo esto: desde que enfermó, los problemas diarios pesaron menos; cuando murió, se le quitó de los hombros el peso de todo lo que creía importante.
- **Cuestionario:** las respuestas son idénticas en ambas idiomas (Parte 1: 1-b 2-d 3-a 4-d 5-d 6-c 7-c 8-b 9-a 10-d 11-d 12-a 13-a 14-c 15-c 16-c 17-c 18-d 19-d 20-a 21-b 22-a 23-d 24-c 25-b 26-b 27-c 28-b 29-b 30-a; Parte 2: 31-b 32-a 33-d 34-c 35-c 36-a 37-d 38-b 39-b 40-a; Parte 4: 41-c 42-a 43-d 44-b 45-c 46-b 47-d 48-a 49-b 50-c).
- **Coherencia entre ediciones:** cualquier cambio de contenido se aplica en las dos.
- **Honestidad:** en KDP se debe declarar el uso de IA; no "ocultar" la IA, sino mejorar la calidad.

## Pendientes

1. **Hablar con Codex** (CLI `codex` en esta PC) sobre la portada y el lanzamiento usando el brief. Postura actual de Claude: portada sobria (tipográfica o moneda romana) y la selfie de Marco Aurelio para anuncios, contenido A+ y redes.
2. **Metadatos de Amazon** en ambos idiomas: descripción, 7 frases de búsqueda y 3 categorías.
3. Texto de contraportada.
4. Pasada de ritmo: variar los cierres "isn't… it's" (quedan unos 40 en inglés).
5. Antes de publicar: corrector humano nativo, verificar fuentes con traducciones publicadas, confirmar teléfonos de ayuda, ISBN (KDP gratis o INDAUTOR), actualizar el índice en Word ("Actualizar campo").
6. Ideas a futuro: diario acompañante (rutina de 30 días), estrategia de lectores anticipados para reseñas, audiolibro.

## Git

Rama de trabajo: `claude/writer-philosopher-skills-tyikcd` en `Arcaniz/QUERIES-TRABAJO`. No hay pull request abierto.
