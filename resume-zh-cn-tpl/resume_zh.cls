%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% 中文简历文档类 resume_zh.cls
% 版本：v1.4.0
% 最新日期：2025/11/18
% 编译方式：xelatex * 2
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 定义文档类
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume_zh}[Chinese CV Class]
% 定义类选项
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
% 基于article类
\LoadClass{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 关键可配置参数
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 页面布局参数
% 页面边距设置 !IMPORTANT
\newcommand{\@pagelr}{0.75in}            % 左右边距
\newcommand{\@pagetop}{0.59in}           % 上边距
\newcommand{\@pagebottom}{0.69in}        % 下边距
% 间距设置
\newcommand{\@parskip}{0.6em}            % 段落间距
\newcommand{\@multicolsep}{0.4em}        % 多栏环境前后间距
\newcommand{\@columnsep}{2em}            % 栏与栏间距
% 字体设置
\newcommand{\@textsize}{9pt}             % 正文字号 !IMPORTANT
\newcommand{\@textheight}{15pt}          % 正文行距 !IMPORTANT
% 姓名样式参数
\newcommand{\@namesize}{20pt}            % 姓名字号
\newcommand{\@namelineheight}{24pt}      % 姓名行高
\newcommand{\@positionsize}{14pt}        % 意向岗位字号
% 个人信息样式参数
\newcommand{\@infosize}{10pt}            % 个人信息字号
\newcommand{\@infolineheight}{15pt}      % 个人信息行高
% 照片样式参数
\newcommand{\@photowidth}{2cm}           % 照片宽度
\newcommand{\@photospaceadjust}{-1.65em} % 照片与下方内容的距离调整
\newcommand{\@photoup}{0cm}              % 照片上移动量
% 章节标题样式参数
\newcommand{\@cvssize}{12pt}             % 一级标题字号
\newcommand{\@cvslineheight}{14.4pt}     % 一级标题行高
\newcommand{\@cvsunderspace}{0.25em}     % 一级标题文字-下划线距离
\newcommand{\@cvsruleheight}{0.8pt}      % 一级标题下划线高度
% 项目标题样式参数
\newcommand{\@cvssdefaultsize}{10pt}     % 二级标题默认字号
\newcommand{\@cvsslinefactor}{1.5}       % 二级标题行高倍数

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 用户可配置命令（在tex文件中使用）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 页面边距设置
\newcommand{\setmargins}[3]{%
    \renewcommand{\@pagelr}{#1}%
    \renewcommand{\@pagetop}{#2}%
    \renewcommand{\@pagebottom}{#3}%
    % 重新应用geometry设置
    \geometry{
        a4paper, 
        left=\@pagelr, 
        right=\@pagelr, 
        top=\@pagetop, 
        bottom=\@pagebottom
    }%
}
% 段落间距设置
\newcommand{\setparspacing}[1]{%
    \renewcommand{\@parskip}{#1}%
    % 重新应用段落间距设置
    \setlength{\parskip}{\@parskip}
}
% 多栏间距设置
\newcommand{\setmulticolspacing}[2]{%
    \renewcommand{\@multicolsep}{#1}%
    \renewcommand{\@columnsep}{#2}%
    % 重新应用多栏间距设置
    \setlength{\multicolsep}{\@multicolsep}
    \setlength{\columnsep}{\@columnsep}
}
% 正文字体设置
\newcommand{\settextfont}[2]{%
    \renewcommand{\@textsize}{#1}%
    \renewcommand{\@textheight}{#2}%
}
% 姓名样式设置
\newcommand{\setnamestyle}[3]{%
    \renewcommand{\@namesize}{#1}%
    \renewcommand{\@namelineheight}{#2}%
    \renewcommand{\@positionsize}{#3}%
}
% 个人信息样式设置
\newcommand{\setinfostyle}[2]{%
    \renewcommand{\@infosize}{#1}%
    \renewcommand{\@infolineheight}{#2}%
}
% 照片样式设置
\newcommand{\setphotostyle}[3]{%
    \renewcommand{\@photowidth}{#1}%
    \renewcommand{\@photospaceadjust}{#2}%
    \renewcommand{\@photoup}{#3}%
}
% 章节标题样式设置
\newcommand{\setcvstitle}[4]{%
    \renewcommand{\@cvssize}{#1}%
    \renewcommand{\@cvslineheight}{#2}%
    \renewcommand{\@cvsunderspace}{#3}%
    \renewcommand{\@cvsruleheight}{#4}%
}
% 项目标题样式设置
\newcommand{\setcvssstyle}[2]{%
    \renewcommand{\@cvssdefaultsize}{#1}%
    \renewcommand{\@cvsslinefactor}{#2}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 导入必要的包
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{xeCJK}
\RequirePackage{fontspec}
\RequirePackage{geometry}
\RequirePackage{enumitem}
\RequirePackage{multicol}
\RequirePackage{parskip}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage{hyperref}
\RequirePackage{ifthen}
\RequirePackage{xparse}
\RequirePackage{graphicx}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 页面、段落设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 设置页面边距
\geometry{
    a4paper, 
    left=\@pagelr, 
    right=\@pagelr, 
    top=\@pagetop, 
    bottom=\@pagebottom
}
% 不显示页眉页脚
\pagestyle{empty}
% 段落间距设置
\setlength{\parskip}{\@parskip} % 默认0.6em
% 多栏间距设置
\setlength{\multicolsep}{\@multicolsep} % 多栏环境前后间距
\setlength{\columnsep}{\@columnsep} % 栏与栏间距
% 设置列表间距
\setlist[itemize]{
    leftmargin=*,
    label=\textbullet,
    labelsep=0.5em,
    parsep=0pt,    % 项内段落间距为0
    itemsep=0pt,   % 项间间距为0
    topsep=0pt,    % 列表顶部间距为0
    partopsep=0pt, % 列表部分顶部间距为0
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 字体字号、文字风格设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 设置主要字体
\setmainfont{Microsoft YaHei}  % 英文和数字使用主要字体
\setCJKmainfont{Microsoft YaHei}[AutoFakeSlant]  % 中文使用主要字体
% 设置斜体使用楷体
\setCJKsansfont{KaiTi}  % 设置无衬线字体为楷体（用于斜体）
\newCJKfontfamily{\kaishu}{KaiTi}  % 定义楷书字体命令
% 重定义斜体命令以使用楷体
\let\oldtextit\textit
\renewcommand{\textit}[1]{{\kaishu #1}}
% 设置默认字号、行距
\renewcommand{\normalsize}{\fontsize{\@textsize}{\@textheight}\selectfont}
% 支持下划线命令 \CJKunderline
\RequirePackage{xeCJKfntef}
% 设置超链接颜色
\definecolor{linkcolor}{RGB}{45,83,160}
\hypersetup{
    colorlinks=false, 
    urlcolor=linkcolor, % 网址颜色
    hidelinks, 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 自定义命令和环境
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 姓名
% 1.对齐方式（可选，left/center/right，默认center）；2.姓名内容；3.意向岗位（可选）；
\NewDocumentCommand{\name}{O{center} m O{}}{%
    \begingroup
    \fontsize{\@namesize}{\@namelineheight}\selectfont % 设置字体大小
    \bfseries
    \ifstrequal{#1}{center}{\centering}{% 设置居中或左右对齐
        \ifstrequal{#1}{left}{\raggedright}{
            \ifstrequal{#1}{right}{\raggedleft}{\centering}
        }%
    }%
    \IfValueTF{#3}{% 如果提供了意向岗位
        #2% 姓名内容
        \fontsize{\@positionsize}{\@namelineheight}\selectfont % 使用指定的字号，行距与姓名一致
        \quad #3% 意向岗位内容
    }{#2}% 如果没有意向岗位，正常显示姓名
    \par% 结束段落
    \endgroup
    \vspace{5pt}% 下方间距
}

% 个人信息
% 1.对齐方式（可选，left/center/right，默认center）；2.信息内容（用逗号分隔）
\NewDocumentCommand{\info}{O{center} m}{%
    \begingroup
    \fontsize{\@infosize}{\@infolineheight}\selectfont
    \ifstrequal{#1}{center}{\centering}{% 设置居中或左右对齐
        \ifstrequal{#1}{left}{\raggedright}{
            \ifstrequal{#1}{right}{\raggedleft}{\centering}
        }%
    }%
    \processinfo{#2}%
    \endgroup
}
\NewDocumentCommand{\processinfo}{m}{%
    \def\infolist{#1}%
    \def\firstitem{1}%
    \@for\currentinfo:=\infolist\do{% 遍历信息项
        \ifnum\firstitem=1\relax
            \currentinfo%
            \def\firstitem{0}%
        \else
            ~|~\currentinfo%
        \fi
    }%
    \par % 添加这一行，创建段落结束，触发对齐
}

% 链接文本：1.链接地址；2.显示文本
\NewDocumentCommand{\link}{m m}{%
    \href{#1}{\CJKunderline{#2}}
}

% 照片
% 1.照片文件相对路径；2.照片水平偏移量（可选，默认为页面左右边距）；3.照片垂直偏移量（可选，默认页面上边距）（相对于页面最右上角） 4. 照片上移动量（可选）
\NewDocumentCommand{\photo}{m O{\@pagelr} O{\@pagetop} O{\@photoup}}{%
    \begin{tikzpicture}[remember picture, overlay]
        % 调整照片位置，相对于页面右上角；+0.1cm 符合实际情况
        \node [anchor=north east, xshift=-#2+0.1cm, yshift=-#3+0.1cm+#4]
            at (current page.north east) 
        {\includegraphics[width=\@photowidth]{#1}};
    \end{tikzpicture}
    \vspace{\@photospaceadjust} % 调整照片与下方内容的距离
}

% 一级标题/章节命令：1.标题内容
\NewDocumentCommand{\cvs}{m}{%
    \par\nointerlineskip % 取消与上一段的间距
    \phantomsection % 为PDF书签添加锚点
    \addcontentsline{toc}{section}{#1} % 添加到PDF书签，级别为一级标题
    {\fontsize{\@cvssize}{\@cvslineheight}\selectfont\textbf{#1}} % 小四字号(12pt)，加粗
    \par\nointerlineskip
    \vspace{\@cvsunderspace} % 文字-下划线距离
    \hbox to \hsize{\vrule width \hsize height \@cvsruleheight} % 下划线宽度
    \par\nointerlineskip % 取消与下一段的间距
}

% 二级标题/项目标题命令：
% 1.字号(可选)；2.PDF书签文本；3.标题内容，项目名称；4.职责/角色/专业；5.日期范围；6.额外补充信息（可选）；7.分隔符（可选）；8.是否加粗项目名称（可选）
\NewDocumentCommand{\cvss}{O{\@cvssdefaultsize} m m m m O{} O{，} O{true}}{%
    \par\nointerlineskip % 取消与上一段的间距
    \begingroup
    \phantomsection
    \addcontentsline{toc}{subsection}{#2}
    % 设置字体大小和行距（行距为字体大小的1.5倍）
    \fontsize{#1}{\dimexpr \@cvsslinefactor\dimexpr#1pt\relax\relax}\selectfont
    \noindent
    % 左对齐部分
    \textbf{#3}% 项目名始终加粗
    \ifthenelse{\equal{#8}{true}}{% 是否加粗其余部分
        \textbf{\if\relax\detokenize{#6}\relax #7#4\else #7#4#7#6\fi}%
    }{%
        \if\relax\detokenize{#6}\relax #7#4\else #7#4#7#6\fi%
    }%
    \hfill \textbf{#5}% 右对齐部分（日期）
    \par\nointerlineskip % 取消与下一段的间距
    \endgroup
}

% 列表环境：替换原版无序列表，支持单栏/多栏排版
% 1.栏数（可选，默认1栏）
\NewDocumentEnvironment{cvl}{O{1}}{%
    \IfValueT{#1}{%
        \ifnum#1>1
            \begin{multicols}{#1} % 多栏排版
        \fi
    }%
    \begin{itemize}
}{%
    \end{itemize}
    \IfValueT{#1}{%
        \ifnum#1>1
            \end{multicols} % 结束多栏排版
        \fi
    }%
}

% 获奖条目：在列表环境中使用，自动包含\item
% 1.奖项名称；2.获奖时间
\NewDocumentCommand{\al}{m m}{%
    \item #1 \hfill #2
}