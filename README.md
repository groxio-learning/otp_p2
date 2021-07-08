# OTP/Elixir July 2021 class info. Your homework. 

## 1 Install these tools, plus Elixir

The tools you will need to install: 

- zoom 
- git (https://git-scm.com/downloads). 
- an editor that you are comfortable with. 
- a working Elixir/OTP install

For the development dependencies, you'll need: 

- Elixir 1.11, with OTP 23. Make sure it's working: 

run the command: 

```
[clock] ➔ elixir -v
Erlang/OTP 23 [erts-11.0] [source] [64-bit] [smp:12:12] [ds:12:12:10] [async-threads:1] [hipe]

Elixir 1.11.2 (compiled with Erlang/OTP 23)
```

It's best if you can also run Observer: 

```elixir
iex(1)> :observer.start()
:ok
```

Make sure your Elixir installation is working!

## 2. Clone this repository

1. Fork this repository to your github account. 

- Go to https://github.com/groxio-learning/otp_p2
- Click the `fork` button in the upper right corner
- Navigate to *your local version* (at something like git@github.com:your-github-user/otp_p2.git. )
- Copy the clone address to your clipboard. In the upper right, click `clone or download` then `copy to clipboard`

2. Clone your local version to your local machine. 

- Clone it. *REPLACE your-github-account with your account*:  

```
>  git clone <paste the url>
...clones repo...
cd otp_p2
```

- Verify your remote: 

```
$ git remote -v
> origin  https://github.com/your-user/otp_p2.git (fetch)
> origin  https://github.com/your-user/otp_p2.git (push)
```


- If there's no origin, set it. Make sure you *replace your-github-user*:

```
otp_p2> git remote add origin https://github.com/your-github-user/otp_p2.git
```

- Verify your remote: 

```
$ git remote -v
> origin  https://github.com/your-user/otp_p2.git (fetch)
> origin  https://github.com/your-user/otp_p2.git (push)
```

- Set the upstream to the Groxio repo:

```
otp_p2> git remote add upstream https://github.com/groxio-learning/otp_p2.git
```

- Verify the remotes: 

```
> origin  https://github.com/your-user/otp_p2.git (fetch)
> origin  https://github.com/your-user/otp_p2.git (push)
> upstream  https://github.com/groxio-learning/otp_p2.git (fetch)
> upstream  https://github.com/groxio-learning/otp_p2.git (push)
```

3. Now check out your setup. Send me a pull request: Edit the file "pull_requests.md" and add your name: 

- git pull upstream main
- Edit pull_requests.md

```
1. Bruce Tate
2. 
3. 
4. 
5. 
6. 
```

Hint: To avoid possible conflicts, don't add your name to the top of the list. Add somewhere in the middle. 

- Commit the file and push

```
> git commit . -m "my commit"

...some happy success message...

> git push origin main

...some happy success message...
```

Now go to your repo online. Click: "Compare and create pull request" 

Your homework is done!
