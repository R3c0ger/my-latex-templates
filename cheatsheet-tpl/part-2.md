# The Markdown File Input

## The Second-level Heading

### This is a third-level heading

Here is some sample markdown content for the second part of the cheatsheet template. You can add more sections, lists, code snippets, and other markdown elements as needed.

**Note:**
- Enable the `markdown` package in the `cheatsheet.sty` file to use markdown features.
  - The *detailed instructions* are provided in the `cheatsheet.sty` comments.
  - A directory of `_markdown_<texfilename>` will be created to store intermediate files during compilation. You can safely ~~delete~~ this directory after compilation if needed.
- For the percentage signs (\%) in Markdown, you may need to escape them as `\\\%` to avoid L^A^T~E~X compilation problems.

<!-- Attention -->
$$
\textrm{Attention}(\boldsymbol{Q}, \boldsymbol{K}, \boldsymbol{V}) = \textrm{softmax}\left(\frac{\boldsymbol{Q} \boldsymbol{K}^T}{\sqrt{d_k}}\right)\boldsymbol{V}
$$

1. First ordered item $\mathbf{W}^{(l)}_{i}$
2. Second ordered item
   1. Subitem 2.1
   2. Subitem 2.2

```c
#include <stdio.h>
int main() {
    printf("Hello, World!\n");
    return 0;
}
```

Here is a simple table:

| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Row 1    | Data 1   | Data 2   |
| Row 2    | Data 3   | Data 4   |
| Row 3    | Data 5   | Data 6   |

> This is a blockquote example. You can use blockquotes to highlight important informations.

A horizontal rule follows:

---

The end of the markdown content for this cheatsheet template.