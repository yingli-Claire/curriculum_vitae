\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{MyResume}[20231231 CV Template]

% ============
% 一、全局设置
% ============

% 页面设置
\LoadClass{article}        % 继承article类
\RequirePackage[a4paper, margin=0.75in]{geometry}  % 纸张、页边距
\RequirePackage{indentfirst}
\setlength\parindent{0em}  % 缩进
\linespread{1.5}           % 行距
\pagestyle{empty}          % 设置页面风格，不显示页眉和页脚
\RequirePackage[fontsize=11pt]{fontsize} % 全局字号

% 上标
% \RequirePackage[super]{nth} % 使用：\nth{1} 变成 1^{st}

% 设置西文字体
\RequirePackage{fontspec}
    \setmainfont[       % 西文默认字体
        Path           = fonts/,
        BoldFont       = EBGaramond-Bold,
        ItalicFont     = EBGaramond-Italic,
        BoldItalicFont = EBGaramond-BoldItalic,
    ]{EBGaramond-Regular}
    \setsansfont[       % 西文无衬线字体，调用：{\sffamily text in sans-serif font}
        Path           = fonts/,
        BoldFont       = NotoSans-Bold,
        ItalicFont     = NotoSans-Italic,
        BoldItalicFont = NotoSans-BoldItalic,
    ]{NotoSans-Regular}
    \setmonofont[       % 西文等宽字体，调用：{\ttfamily text in monospaced font}.
        Path           = fonts/,
        BoldFont       = Inconsolata-ExtraBold,
        ItalicFont     = Inconsolata-Medium,
        BoldItalicFont = Inconsolata-ExtraBold,
    ]{Inconsolata-Medium}

% 设置中文字体
\RequirePackage{xeCJK}
    \xeCJKsetup{        % 标点符号样式，详见xeCJK宏包手册
        PunctStyle = kaiming
    }
    \setCJKmainfont[    % 中文默认字体
        Path           = fonts/,
        BoldFont       = NotoSerifSC-Black,
        ItalicFont     = NotoSerifSC-ExtraLight,
        BoldItalicFont = NotoSerifSC-SemiBold,
    ]{NotoSerifSC-Regular}
    \setCJKsansfont[    % 中文无衬线字体
        Path           = fonts/,
        BoldFont       = NotoSansSC-Bold,
        ItalicFont     = NotoSansSC-Regular,
        BoldItalicFont = NotoSansSC-Bold,
    ]{NotoSansSC-Regular}
    \setCJKmonofont[    % 中文等宽字体
        Path           = fonts/,
        BoldFont       = NotoSansSC-Bold,
        ItalicFont     = NotoSansSC-Regular,
        BoldItalicFont = NotoSansSC-Bold,
    ]{NotoSansSC-Regular}

% 列表
\RequirePackage{enumitem} % 自定义列表格式
\setlist{noitemsep} % removes spacing from items but leaves space around the whole list，包括itemize和enumerate
\setlist[itemize]{topsep=0.25em, leftmargin=2pc} % 设置itemize环境（无序列表），垂直间距（topsep），左边距（leftmargin）
\setlist[enumerate]{topsep=0.25em, leftmargin=2pc} % 设置enumerate环境（有序列表）

% 标题
\RequirePackage{titlesec} % 自定义标题（section、subsection等）
\titleformat{\section}         % 定义 section 格式
  {\Large\scshape\bfseries\raggedright} % 大号字体（\Large），小型大写字母（\scshape），左对齐（\raggedright）。
  {}{0em}                      % Give a prefix to all sections, like 'Section ...'
  {}                           % Insert code before the heading
  [\titlerule]                 % 在标题之后插入水平线
\titlespacing*{\section}{0cm}{*3}{*1} % 间距。\titlespacing{<命令>}{<左>}{<上>}{<下>}。*表示弹性
\titleformat{\subsection}
  {\large\raggedright}
  {}{0em}
  {}
\titlespacing*{\subsection}{0cm}{*1}{*1}

% ============
% 二、自定义命令
% ============

%带日期的节
\newcommand{\datedsection}[2]{
  \section[#1]{#1 \hfill #2}%
}
\newcommand{\datedsubsection}[2]{%
  \subsection[#1]{#1 \hfill #2}%
}
\newcommand{\datedline}[2]{%
  {\par #1 \hfill #2 \par}%
}

% name
\newcommand{\name}[1]{
  \centerline{\Huge\scshape{#1}} 
  \vspace{4ex} % 文本之后添加垂直空白
}

% otherinfo
\RequirePackage{xifthen} % use if then
\newcommand{\info}[4]{
  \centerline{\large{\ {#1}}
    \ifthenelse{\isempty{#2}}%
      { } % if {#2} is empty
      {\textperiodcentered\ \ {#2} } % homepage, no space before \text...
    \ifthenelse{\isempty{#3}}%
      { } % if {#3} is empty
      {\textperiodcentered\ \ {#3} } % homepage, no space before \text...
    \ifthenelse{\isempty{#4}}%
      { } % if {#3} is empty
      {\textperiodcentered\ \ {#4} }
  }
  \vspace{2ex}
}


% ============
% 三、超链接
% ============

% 配置颜色
% \RequirePackage{xcolor}
% \definecolor{Main}{cmyk}{1, 0.6, 0, 0.5}
%正文中 \colorbox{Main}{\textcolor{white}{内容} 使用

% 设置超链接
\RequirePackage[
    colorlinks,
    urlcolor    = blue,
    linkcolor   = blue,
    anchorcolor = blue,
    citecolor   = blue,
]{hyperref}

