if (! this.sh_languages) {
  this.sh_languages = {};
}
sh_languages['diff'] = [
  [
    {
      'next': 1,
      'regex': /(?=^[-]{3})/g,
      'state': 1,
      'style': 'sh_oldfile'
    },
    {
      'next': 6,
      'regex': /(?=^[*]{3})/g,
      'state': 1,
      'style': 'sh_oldfile'
    },
    {
      'next': 14,
      'regex': /(?=^[\d])/g,
      'state': 1,
      'style': 'sh_difflines'
    }
  ],
  [
    {
      'next': 2,
      'regex': /^[-]{3}/g,
      'style': 'sh_oldfile'
    },
    {
      'next': 3,
      'regex': /^[-]/g,
      'style': 'sh_oldfile'
    },
    {
      'next': 4,
      'regex': /^[+]/g,
      'style': 'sh_newfile'
    },
    {
      'next': 5,
      'regex': /^@@/g,
      'style': 'sh_difflines'
    }
  ],
  [
    {
      'exit': true,
      'regex': /$/g
    }
  ],
  [
    {
      'exit': true,
      'regex': /$/g
    }
  ],
  [
    {
      'exit': true,
      'regex': /$/g
    }
  ],
  [
    {
      'exit': true,
      'regex': /$/g
    }
  ],
  [
    {
      'next': 7,
      'regex': /^[*]{3}[ \t]+[\d]/g,
      'style': 'sh_oldfile'
    },
    {
      'next': 9,
      'regex': /^[*]{3}/g,
      'style': 'sh_oldfile'
    },
    {
      'next': 10,
      'regex': /^[-]{3}[ \t]+[\d]/g,
      'style': 'sh_newfile'
    },
    {
      'next': 13,
      'regex': /^[-]{3}/g,
      'style': 'sh_newfile'
    }
  ],
  [
    {
      'next': 8,
      'regex': /^[\s]/g,
      'style': 'sh_normal'
    },
    {
      'exit': true,
      'regex': /(?=^[-]{3})/g,
      'style': 'sh_newfile'
    }
  ],
  [
    {
      'exit': true,
      'regex': /$/g
    }
  ],
  [
    {
      'exit': true,
      'regex': /$/g
    }
  ],
  [
    {
      'next': 11,
      'regex': /^[\s]/g,
      'style': 'sh_normal'
    },
    {
      'exit': true,
      'regex': /(?=^[*]{3})/g,
      'style': 'sh_newfile'
    },
    {
      'exit': true,
      'next': 12,
      'regex': /^diff/g,
      'style': 'sh_normal'
    }
  ],
  [
    {
      'exit': true,
      'regex': /$/g
    }
  ],
  [
    {
      'exit': true,
      'regex': /$/g
    }
  ],
  [
    {
      'exit': true,
      'regex': /$/g
    }
  ],
  [
    {
      'next': 15,
      'regex': /^[\d]/g,
      'style': 'sh_difflines'
    },
    {
      'next': 16,
      'regex': /^[<]/g,
      'style': 'sh_oldfile'
    },
    {
      'next': 17,
      'regex': /^[>]/g,
      'style': 'sh_newfile'
    }
  ],
  [
    {
      'exit': true,
      'regex': /$/g
    }
  ],
  [
    {
      'exit': true,
      'regex': /$/g
    }
  ],
  [
    {
      'exit': true,
      'regex': /$/g
    }
  ]
];
